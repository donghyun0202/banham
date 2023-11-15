const clubApplymodal = document.getElementById("club-Apply-modal");
    
function clubApplymodalOn() {
    clubApplymodal.style.display = "flex";
    document.body.style.overflow = 'hidden';
}

function clubApplyisModalOn() {
    return clubApplymodal.style.display === "flex"
}

function clubApplymodalOff() {
    clubApplymodal.style.display = "none";
    document.body.style.removeProperty('overflow');
}

/*function clubApplyModal() {
    clubApplymodalOn()
}*/


function clubApplycancellButton(){
    clubApplymodalOff()
}

clubApplymodal.addEventListener("click", e => {
    const evTarget = e.target
    if(evTarget.classList.contains("explainWrap")) {
        clubApplymodalOff()
    }
})

window.addEventListener("keyup", e => {
    if(clubApplyisModalOn() && e.key === "Escape") {
        clubApplymodalOff()
    }
})

