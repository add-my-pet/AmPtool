// last modified: 2018/07/01

// Intended use:
//    <div class = "dropdown">
//      <button onclick="showDropdown('Name')" class="dropbtn">Name</button>
//      <div id="Name" class="dropdown-content">
//	  <a href="..">..</a>
//      </div> <!-- end of dropdown-content -->
//    </div> <!-- end of dropdown -->
function showDropdown(Dropdown) {
    document.getElementById(Dropdown).classList.toggle("show");
}

// Close the dropdown if the user clicks outside of it
window.onclick = function(event) {
  if (!event.target.matches('.dropbtn')) {

    var dropdowns = document.getElementsByClassName("dropdown-content");
    var i;
    for (i = 0; i < dropdowns.length; i++) {
      var openDropdown = dropdowns[i];
      if (openDropdown.classList.contains('show')) {
        openDropdown.classList.remove('show');
      }
    }
  }
}
