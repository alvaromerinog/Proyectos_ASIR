/*
Evento de las checkbox para que se modifiquen cuando se hace click en un artículo
 */
const evento = new Event('change');

/*
Eventos en el artículo India
 */
let india = document.querySelector('#india');
let indiaCb = document.querySelector('#ind');
indiaCb.addEventListener('change', function () {
    if (indiaCb.checked === true) {
        india.style.backgroundColor = '#f8e0b9';
    } else {
        india.style.backgroundColor = 'transparent';
    }
});
india.addEventListener('click', function () {
    if (indiaCb.checked === true) {
        indiaCb.checked = false;
        indiaCb.dispatchEvent(evento);
    } else {
        indiaCb.checked = true;
        indiaCb.dispatchEvent(evento);
    }
});

/*
Eventos en el artículo Mexico
 */
let mexico = document.querySelector('#mexico');
let mexicoCb = document.querySelector('#mx');

mexicoCb.addEventListener('change', function () {
    if (mexicoCb.checked === true) {
        mexico.style.backgroundColor = '#f8e0b9';
    } else {
        mexico.style.backgroundColor = 'transparent';
    }
});
mexico.addEventListener('click', function () {
    if (mexicoCb.checked === true) {
        mexicoCb.checked = false;
        mexicoCb.dispatchEvent(evento);
    } else {
        mexicoCb.checked = true;
        mexicoCb.dispatchEvent(evento);
    }
});

/*
Eventos en el artículo Nueva Zelanda
 */
let nzelanda = document.querySelector('#nzelanda');
let nzelandaCb = document.querySelector('#nz');
nzelandaCb.addEventListener('change', function () {
    if (nzelandaCb.checked === true) {
        nzelanda.style.backgroundColor = '#f8e0b9';
    } else {
        nzelanda.style.backgroundColor = 'transparent';
    }
});
nzelanda.addEventListener('click', function () {
    if (nzelandaCb.checked === true) {
        nzelandaCb.checked = false;
        nzelandaCb.dispatchEvent(evento);
    } else {
        nzelandaCb.checked = true;
        nzelandaCb.dispatchEvent(evento);
    }
});

/*
Eventos en el artículo Peru
 */
let peru = document.querySelector('#peru');
let peruCb = document.querySelector('#per');
peruCb.addEventListener('change', function () {
    if (peruCb.checked === true) {
        peru.style.backgroundColor = '#f8e0b9';
    } else {
        peru.style.backgroundColor = 'transparent';
    }
});
peru.addEventListener('click', function () {
    if (peruCb.checked === true) {
        peruCb.checked = false;
        peruCb.dispatchEvent(evento);
    } else {
        peruCb.checked = true;
        peruCb.dispatchEvent(evento);
    }
});


/*
Eventos en el artículo Islandia
 */
let islandia = document.querySelector('#islandia');
let islandiaCb = document.querySelector('#isl');
islandiaCb.addEventListener('change', function () {
    if (islandiaCb.checked === true) {
        islandia.style.backgroundColor = '#f8e0b9';
    } else {
        islandia.style.backgroundColor = 'transparent';
    }
});
islandia.addEventListener('click', function () {
    if (islandiaCb.checked === true) {
        islandiaCb.checked = false;
        islandiaCb.dispatchEvent(evento);
    } else {
        islandiaCb.checked = true;
        islandiaCb.dispatchEvent(evento);
    }
});

/*
Eventos en el artículo Japón
 */
let japon = document.querySelector('#japon');
let japonCb = document.querySelector('#jp');
japonCb.addEventListener('change', function () {
    if (japonCb.checked === true) {
        japon.style.backgroundColor = '#f8e0b9';
    } else {
        japon.style.backgroundColor = 'transparent';
    }
});
japon.addEventListener('click', function () {
    if (japonCb.checked === true) {
        japonCb.checked = false;
        japonCb.dispatchEvent(evento);
    } else {
        japonCb.checked = true;
        japonCb.dispatchEvent(evento);
    }
});

