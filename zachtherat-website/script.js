document.addEventListener('DOMContentLoaded', () => {
  // Explosion effect
  const explosionBtn = document.getElementById('explosion-btn');
  const explosionDiv = document.createElement('div');
  explosionDiv.className = 'explosion-effect';
  document.body.appendChild(explosionDiv);

  explosionBtn.addEventListener('click', () => {
    explosionDiv.classList.add('active');
    setTimeout(() => {
      explosionDiv.classList.remove('active');
    }, 1000);
  });

  // Guestbook functionality
  const guestbookForm = document.getElementById('guestbook-form');
  const guestbookEntries = document.getElementById('guestbook-entries');

  guestbookForm.addEventListener('submit', (e) => {
    e.preventDefault();
    const username = document.getElementById('username').value.trim();
    const message = document.getElementById('message').value.trim();
    
    if (username && message) {
      const entryDiv = document.createElement('div');
      entryDiv.classList.add('guestbook-entry');
      entryDiv.innerHTML = `<strong>${username}</strong>: <em>${message}</em>`;
      guestbookEntries.prepend(entryDiv);
  
      // Store entries in localStorage so they persist
      let entries = JSON.parse(localStorage.getItem('guestbook')) || [];
      entries.unshift({ username, message });
      localStorage.setItem('guestbook', JSON.stringify(entries));
  
      guestbookForm.reset();
    }
  });
  
  // Load stored guestbook entries
  let storedEntries = JSON.parse(localStorage.getItem('guestbook')) || [];
  storedEntries.forEach(entry => {
    const entryDiv = document.createElement('div');
    entryDiv.classList.add('guestbook-entry');
    entryDiv.innerHTML = `<strong>${entry.username}</strong>: <em>${entry.message}</em>`;
    guestbookEntries.appendChild(entryDiv);
  });
  
  // Music controls
  const bgMusic = document.getElementById('bg-music');
  const muteButton = document.getElementById('mute-button');
  
  // Attempt to autoplay music on user interaction
  document.body.addEventListener('click', () => {
    if (bgMusic.paused) {
      bgMusic.play().catch(error => console.error("Autoplay failed:", error));
    }
  });
  
  muteButton.addEventListener('click', () => {
    bgMusic.muted = !bgMusic.muted;
    muteButton.textContent = bgMusic.muted ? "Unmute" : "Mute";
  });
});
