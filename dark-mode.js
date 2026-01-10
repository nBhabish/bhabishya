// Dark mode toggle functionality
(function() {
  // Check for saved theme preference or default to light mode
  const currentTheme = localStorage.getItem('theme') || 'light';

  // Apply the theme on page load
  if (currentTheme === 'dark') {
    document.documentElement.setAttribute('data-theme', 'dark');
  }

  // Wait for DOM to be ready
  document.addEventListener('DOMContentLoaded', function() {
    // Create toggle button
    const toggleButton = document.createElement('button');
    toggleButton.id = 'theme-toggle';
    toggleButton.setAttribute('aria-label', 'Toggle dark mode');
    toggleButton.innerHTML = currentTheme === 'dark' ? '☀️' : '🌙';

    // Add button to navbar
    const navbar = document.querySelector('.navbar');
    if (navbar) {
      navbar.appendChild(toggleButton);
    }

    // Toggle theme on button click
    toggleButton.addEventListener('click', function() {
      const currentTheme = document.documentElement.getAttribute('data-theme');
      const newTheme = currentTheme === 'dark' ? 'light' : 'dark';

      document.documentElement.setAttribute('data-theme', newTheme);
      localStorage.setItem('theme', newTheme);
      toggleButton.innerHTML = newTheme === 'dark' ? '☀️' : '🌙';
    });
  });
})();
