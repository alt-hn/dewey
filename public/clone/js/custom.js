document.addEventListener('DOMContentLoaded', function () {
    // Xóa sự kiện hover mặc định
    jQuery('nav.elementor-nav-menu--main').off('pointerover pointermove pointerout MSPointerOver MSPointerMove MSPointerOut');

    // Bật sự kiện click để mở popup
    const menus = [
        { selector: '.vechungtoi', popupId: '59944' },
        { selector: '.coso', popupId: '436' },
        { selector: '.ctdt', popupId: '527' },
        { selector: '.tuyensinh', popupId: '61127' },
        { selector: '.doisonghocduong', popupId: '61150' },
        { selector: '.goctdser', popupId: '532' },
        { selector: '.vechungtoien', popupId: '60363' },
        { selector: '.cosoen', popupId: '29752' },
        { selector: '.ctdten', popupId: '29754' },
        { selector: '.admission', popupId: '61243' },
        { selector: '.goctdseren', popupId: '29756' },
        { selector: '.schoollife', popupId: '61224' } 
    ];

    menus.forEach(menu => {
        let elements = document.querySelectorAll(`nav.elementor-nav-menu--main ${menu.selector}`);

        elements.forEach(element => {
            element.addEventListener('click', function (event) {
                event.preventDefault(); // Ngăn chặn hành vi mặc định
                elementorProFrontend.modules.popup.showPopup({ id: menu.popupId });
            });
        });
    });
});
