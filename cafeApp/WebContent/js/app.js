/**
 * 2023.10.19
 * @author kss
 * @description 공통
 */

// 상단 메뉴
const header = document.querySelector('header');

if(header.className != 'sticky') {
    const scrollPosition = () => {
	
        let scroll = this.scrollY;
        let headheight = header.clientHeight;
        
        if(scroll > headheight) {
            header.classList.add('fixed');
        } else {
            header.classList.remove('fixed');
        }
    }        

    window.addEventListener('load', scrollPosition);
    window.addEventListener('scroll', scrollPosition);
};

try {
    // 검색 focusin
    document.querySelector('.overlay').addEventListener('click', (e) => {
        e.target.closest('.search').classList.add('active');
        e.target.nextElementSibling.focus();
    });

    // 검색 focusout
    document.querySelector('.inp_search').addEventListener('focusout', (e) => {
        e.target.value = '';
        e.target.closest('.search').classList.remove('active');
    });
} catch(e) {

}

// gnb
const gnb = document.querySelectorAll('nav li');
const pathname = location.pathname.split('/');
let idx = 0;
switch(pathname[1]) {
	case 'board': idx = 1;
		break;
	case 'order': case 'cafe': idx = 2;
		break;
	case 'product': idx = 3;
		break;
	case 'member': idx = 4;
		break;
	default: idx = 0;
}

gnb[idx].classList.add('on');

