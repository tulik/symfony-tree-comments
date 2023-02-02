$(document).on('click', '#comment-like', function (e) {

    //prevent the link from following the url
    e.preventDefault();

    var url = $(this).attr('href');
    var entityId = $(this).attr('data-entity-id');
    var csrfToken = $(this).attr('data-csrf-token');
    var isLiked = $(this).attr('data-liked');
    var likesCounter = $(this).attr('data-likes-counter');

    if (isLiked === '0') {
        $(this).attr('data-liked', 1);
        $('.♡').addClass('liked').text('♥')
    } else {
        $(this).attr('data-liked', 0);
        $('.♡').removeClass('liked').text('♡')
    }

    //sending this data to CommentLikeController
    $.ajax({
        type: 'POST',
        dataType: 'json',
        data: {'entityId': entityId, 'csrfToken': csrfToken, 'likesCounter': likesCounter},
        url: url,
        success: function (response) {
            // countLikes is returned in json response from CommentLikeController
            $('#count-likes-' + entityId).text(response['countLikes']);
            console.log("success")
        },
        error: function () {
        }
    });
});

