#' import your own snap and make a palette
#' 
#' @param path path to picture in png form
#' @param n number of colours in outputted palette
#' @param plot_picture plot picture segmented into palette colours, defaults to FALSE (TRUE or FALSE)
#' @param plot_palette plot resulting palette, defaults to TRUE
#' 
#' @references https://www.r-bloggers.com/color-quantization-in-r/
#' 
#' @export
#' @return new palette
#' 
snap2palette = function(path, 
                        n, 
                        plot_picture = FALSE,
                        plot_palette = TRUE){
  
  #check loading a png
  if(file_ext(path) != "png"){
    stop("path does not lead to a .png")
  }
  
  #import file
  snap = readPNG(path)
  
  #split and average into n colours
  # reshape image into a data frame
  df = data.frame(
    red = matrix(snap[,,1], ncol=1),
    green = matrix(snap[,,2], ncol=1),
    blue = matrix(snap[,,3], ncol=1)
  )
  
  # compute the k-means clustering
  K = kmeans(df,n)
  
  #plot picture or not
  if(plot_picture){
    
    df$label = K$cluster
    
    # get the coloring
    colors = data.frame(
      label = 1:nrow(K$centers), 
      R = K$centers[,"red"],
      G = K$centers[,"green"],
      B = K$centers[,"blue"]
    )
    
    # merge color codes on to df
    df$order = 1:nrow(df)
    df = merge(df, colors)
    df = df[order(df$order),]
    df$order = NULL
    
    # get mean color channel values for each row of the df.
    R = matrix(df$R, nrow=dim(snap)[1])
    G = matrix(df$G, nrow=dim(snap)[1])
    B = matrix(df$B, nrow=dim(snap)[1])
    
    # reconstitute the segmented image in the same shape as the input image
    snap_segmented = array(dim=dim(snap))
    snap_segmented[,,1] = R
    snap_segmented[,,2] = G
    snap_segmented[,,3] = B
    
    # View the result
    grid.raster(snap_segmented)
    
  }
  
  #make new snapalette
  ## get hex
  new_snapalette = rep(NA, n)
  for(i in 1:n){
    new_snapalette[i] = rgb2hex(r = as.integer(K$centers[i,1]*255), 
                                g = as.integer(K$centers[i,2]*255), 
                                b = as.integer(K$centers[i,3]*255))
  }
  
  names(new_snapalette) = "new_snapalette"
  
  #plot palette or not
  if(plot_palette){
    print.palette(new_snapalette)
  }
  
  return(new_snapalette)
}