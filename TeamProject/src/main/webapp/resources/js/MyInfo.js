const privacy = document.querySelector(".privacy");
const preset = document.querySelector(".preset");

const privacyForm = document.querySelector(".privacy-form");
const presetContents = document.querySelector(".preset-contents");

const auth = document.querySelector(
  ".myInfo-contents .privacy-form .form-item:nth-child(6)"
);

const pwChk = document.querySelector(".pw-chk");

const dropMember = document.querySelector(".drop-member");

privacy.addEventListener("click", () => {
  privacyForm.classList.remove("hidden");
  presetContents.classList.add("hidden");
});

preset.addEventListener("click", () => {
  privacyForm.classList.add("hidden");
  presetContents.classList.remove("hidden");
});

pwChk.addEventListener("click", (event) => {
  event.preventDefault();
});

dropMember.addEventListener("click", (event) => {
  event.preventDefault();
});