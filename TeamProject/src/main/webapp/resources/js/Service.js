const help = document.querySelector(".help");
const notice = document.querySelector(".notice");
const ques = document.querySelector(".ques");

const helpContents = document.querySelector(".help-contents");
const noticeContents = document.querySelector(".notice-contents");
const quesContents = document.querySelector(".ques-contents");

const helpToggle = document.querySelectorAll(".help-toggle");
const answer = document.querySelector(".answer");

const commentAdd = document.querySelector(".service .btn-area .comment-add");
const commentDel = document.querySelector(".service .btn-area .comment-del");

help.addEventListener("click", () => {
  helpContents.classList.remove("hidden");
  noticeContents.classList.add("hidden");
  quesContents.classList.add("hidden");
});

notice.addEventListener("click", () => {
  helpContents.classList.add("hidden");
  noticeContents.classList.remove("hidden");
  quesContents.classList.add("hidden");
});

ques.addEventListener("click", () => {
  helpContents.classList.add("hidden");
  noticeContents.classList.add("hidden");
  quesContents.classList.remove("hidden");
});

function openCloseAnswer() {
  const answerId = this.id.replace("que", "ans");
  console.log(this.id);
  console.log(answerId);
  if (document.getElementById(answerId).classList.contains("hidden")) {
    document.getElementById(answerId).classList.remove("hidden");
    document.getElementById(this.id + "-toggle").textContent = "-";
  } else {
    document.getElementById(answerId).classList.add("hidden");
    document.getElementById(this.id + "-toggle").textContent = "+";
  }
}

helpToggle.forEach((item) => item.addEventListener("click", openCloseAnswer));

commentAdd.addEventListener("click", () => {
  console.log(commentAdd);
});

commentDel.addEventListener("click", () => {
  console.log(commentDel);
});
