$(document).on('click', '#comment-like', function (e) {
    e.preventDefault();

    var url = $(this).attr('href');
    var entityId = $(this).attr('data-entity-id');
    var csrfToken = $(this).attr('data-csrf-token');
    var isLiked = $(this).attr('data-liked');

    if (isLiked === '0') {
        $(this).attr('data-liked', 1);
        $('.♡').addClass('liked').text('♥')
    } else {
        $(this).attr('data-liked', 0);
        $('.♡').removeClass('liked').text('♡')
    }
    $.ajax({
        type: 'POST',
        dataType: 'json',
        data: {'entityId': entityId, 'csrfToken': csrfToken},
        url: url,
        success: function () {
            console.log('Success');
        },
        error: function () {
        }
    });
});