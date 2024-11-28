let slideIndex = 0;
showSliders();

function showSliders(){
    let i;
    let slides = document.getElementsByTagName("slide");
    for (i=0; i < slides.length; i++){
        slides[i].style.display = "none";
    }
    slideIndex++;
    if (slideIndex > slides.length){
        slideIndex = 1;
    }
    slides[slideIndex-1].style.display = "block";
    setTimeout(showSliders, 2000);
}