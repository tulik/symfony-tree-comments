$(document).on('click', '#comment-like', function (e) {

    //prevent the link from following the url
    e.preventDefault();

    let url = $(this).attr('href');
    let entityId = $(this).attr('data-entity-id');
    let csrfToken = $(this).attr('data-csrf-token');

    //sending this data to CommentLikeController
    $.ajax({
        type: 'POST',
        dataType: 'json',
        data: {'entityId': entityId, 'csrfToken': csrfToken},
        url: url,
        success: function (response) {
            // countLikes and isLiked is returned in json response from CommentLikeController
            if (response['isLiked'] === 0) {
                $(this).attr('data-liked', 1);
                $('.comment-like-' + entityId).text('♥')
            } else {
                $(this).attr('data-liked', 0);
                $('.comment-like-' + entityId).text('♡')
            }
            $('#count-likes-' + entityId).text(response['countLikes']);
        },
        error: function () {
        }
    });
});
