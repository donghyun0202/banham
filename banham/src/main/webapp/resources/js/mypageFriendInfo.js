function friendCheck(friendCheckID){
    if(friendCheckID == "friendList"){
        $('.friendMenuWrap #friendList').addClass("friendCheck");
        $('.friendMenuWrap #friendRequest').removeClass("friendCheck");

        $('.friend-list').css("display", "");
        $('.requestBox').css("display", "none");
    }else{
        $('.friendMenuWrap #friendList').removeClass("friendCheck");
        $('.friendMenuWrap #friendRequest').addClass("friendCheck");

        $('.friend-list').css("display", "none");
        $('.requestBox').css("display", "");
    }
}

function requestButton(requestId){
    if(requestId == "request"){
        $('.requestMenuWrap #request').addClass("requestClick");
        $('.requestMenuWrap #sent').removeClass("requestClick");

        $('.friend-request').css("display", "");
        $('.friend-sent').css("display", "none");
    }else{
        $('.requestMenuWrap #request').removeClass("requestClick");
        $('.requestMenuWrap #sent').addClass("requestClick");

        $('.friend-request').css("display", "none");
        $('.friend-sent').css("display", "");
    }

}