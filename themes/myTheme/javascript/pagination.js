if ($(".pagination").length) {
    var paginate = function (url) {
        $.ajax(url)
            .done(function (response) {
                $("body").html(response);
                $("html").animate({
                    scrollTop: 0,
                });
                window.history.pushState({ utl: url }, document.title, url);
            })
            .fail(function (response) {
                alert("Eror:" + response.responseText);
            });
    };
    $(".pagination a").click(function (event) {
        event.preventDefault();
        var url = $(this).attr("href");
        paginate(url);
    });
}
