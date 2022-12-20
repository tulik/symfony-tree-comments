var $container = $('.js-likes');
$container.find('a').on('click', function(e) {
    e.preventDefault();
    var $link = $(e.currentTarget);
    $.ajax({
        url: '/comments/112/like/'+$link.data('direction'),
        method: 'POST'
    }).then(function(data) {
        $container.find('.js-likes-total').text(data.likes);
    });
});
