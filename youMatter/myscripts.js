var i = 0;
          var images = [];
          var time = 3000;

          images[0] = "duo.jpg";
          images[1] = "help.jpg";
          images[2] = "horizon.jpg";
          images[3] = "person.jpg";

          function slideImage(){
            
            document.slide.src = images[i];

            if(i < images.length- 1){
              i++;
            } else{
              i = 0;
            }

            setTimeout("slideImage()", time);
          }

window.onload = slideImage;
slideImage();



