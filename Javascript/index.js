let lightMode = localStorage.getItem('lightMode');
const lightModeToggle=document.querySelector('#light-mode-toggle');
const span=document.querySelector('#logoSwitch')

//check if lightmode is enabled
const enableLightMode = () => {
    document.body.classList.add('lightmode');
    localStorage.setItem('lightMode', 'enabled');
}

const disableLightMode = () => {
    document.body.classList.remove('lightmode');
    localStorage.setItem('lightMode', null);
}

if(lightMode ==='enabled'){
    enableLightMode();
}

lightModeToggle.addEventListener('click', ()=>{
    lightMode = localStorage.getItem('lightMode');
    if(lightMode !== 'enabled'){
        lightModeToggle.classList.remove('fa-sun');
        lightModeToggle.classList.add('fa-moon');
        enableLightMode();
    }else{
        lightModeToggle.classList.remove('fa-moon');
        lightModeToggle.classList.add('fa-sun');
        disableLightMode();
    }
})
