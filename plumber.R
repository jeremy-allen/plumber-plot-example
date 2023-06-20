library(ggplot2)
library(dplyr)
library(stringr)
library(plumber)

#* Return available sample IDs
#* @get /ids
function() {
  # in a real situation this would likely be a call to a pre-existing
  # table in a database, but here I am construction the choices from
  # scratch
  diamonds |> 
    select(cut) |>
    unique() |> 
    mutate(id = paste0("id_", str_to_lower(cut))) |> 
    pull(id)
}

#* Density plot of a sample
#* @param sample_id The id of the sample to plot, try id_premium
#* @serializer png list(width = 450, height = 200)
#* @get /plot
function(sample_id) {
  # in a real situation this would probably be a call to a database of
  # samples, but in this example I am loading an existing data frame
  df <- diamonds |> 
    select(cut, price) |> 
    mutate(id = paste0("id_", str_to_lower(cut))) |> 
    select(id, price) |> 
    filter(id == sample_id) |> 
    sample_n(200) # limiting to 200 samples for demo purposes
 
   # plot the samples and save as an image
  plot <- df |> 
    ggplot(aes(x = price)) +
    geom_density(fill = "#C51DC8", color = "#C51DC8", alpha = .6)
  
  print(plot)

}
