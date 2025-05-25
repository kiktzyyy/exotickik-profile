// script.js

// Helper: typewriter loop
function typeLoop(element, text, typeSpeed, deleteSpeed, pauseTime) {
  let idx = 0, deleting = false;
  function tick() {
    if (!deleting) {
      element.textContent = text.substring(0, idx + 1);
      idx++;
      if (idx === text.length) {
        deleting = true;
        return setTimeout(tick, pauseTime);
      }
    } else {
      element.textContent = text.substring(0, idx - 1);
      idx--;
      if (idx === 0) deleting = false;
    }
    setTimeout(tick, deleting ? deleteSpeed : typeSpeed);
  }
  tick();
}

document.getElementById("overlay").addEventListener("click", () => {
  document.getElementById("overlay").style.display = "none";
  const bg = document.querySelector(".background-video");
  bg.muted = false; bg.play().catch(()=>{});

  // start both loops
  typeLoop(document.getElementById("intro"),
           "Please don't ask me because even I don't know who I am?",
           100, 60, 1500);

  typeLoop(document.getElementById("skillIssue"),
           "SKILL ISSUE",
           100, 60, 1500);
});