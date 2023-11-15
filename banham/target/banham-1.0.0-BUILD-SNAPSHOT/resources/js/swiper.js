var swiper = new Swiper(".mySwiper", {
    slidesPerView : 4, // 한줄당 보여지는 슬라이드 갯수
    slidesPerGroup : 4,// 1페이지당 그룹 갯수
    grid: {
       fill:'row',
       rows:3,
   },
  spaceBetween: 30,
  pagination: {			//페이징
	    el: ".swiper-pagination",
	    clickable: true,			//페이징을 클릭하면 해당 영역으로 이동
	    renderBullet: function(index, className) {
            return `<li class="${className}"><span>${index+1}</span></li>`;
        }
	  },
});