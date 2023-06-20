# plumber-plot-example
A plumber API that returns a id names that can then be used to generate a ggplot2 plot.

The ids endpoint will return id names that can be used. The plot endpoint can take an id name and return a small 550px by 300px plot.

ids end point: https://colorado.posit.co/rsc/test-plot-api/ids.  

plot end point: https://colorado.posit.co/rsc/test-plot-api/plot.  

-  in your browser add "?sample_id=id_premium" (or one of the other id names) to the end of that url to get a plot
-  or use an R package like `httr2` to send the URL as a GET request
-  or use command line utilities like `curl`

![api-density-plot](https://github.com/jeremy-allen/plumber-plot-example/assets/18430826/a68d8fff-52a9-4173-8a08-9d2df3bf733b)

Resources: 
- [Model Deployment and Plumber](https://solutions.posit.co/gallery/plumber-ml/index.html)
- [Using Plumber APIs hosted on Posit Connect](https://docs.posit.co/connect/user/plumber/)
- [Plumber](https://www.rplumber.io/)
