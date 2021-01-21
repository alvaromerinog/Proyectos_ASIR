$(function () {
    /*
    Eventos en los países
    */
    $("#paises article").on("click", function (e) {
        let pais = `${this.id}`;
        let box = `input[value=${pais}]`;
        let check = $(box)[0].checked;
        if (check === false) {
            $(box).prop('checked', true);
            $(box).trigger('change');
        } else {
            $(box).prop('checked', false);
            $(box).trigger('change');
        }
    });
    /*
    Eventos en los checkbox
    */
    $("[type='checkbox']").on('change', function (e) {
        if (this.checked === true) {
            $(`#${this.value}`).css({
                "background-color": "#f8e0b9"
            });
        } else {
            $(`#${this.value}`).css({
                "background-color": "transparent"
            });
        }
    });
});

