$(document).ready(function(){
    $('#add-friend-area').hide();
    $('#friend-button').click(function(){
        $('#add-friend-area').toggle();
        $(this).text($(this).text() == 'New Friend' ? 'Cancel' : 'New Friend');
    });
});