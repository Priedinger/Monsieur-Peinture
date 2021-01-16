const adminPage = document.querySelector('.admin-page')
const initAdminTableToggle = () => {
  if(adminPage) {
    function unHiddeTable(e) {
      const table = document.getElementById(e.target.id).nextElementSibling
      table.classList.toggle("hidden-admin-table");
    }

    const titles = document.querySelectorAll('h3');
    titles.forEach((title) => {
      title.addEventListener('click', unHiddeTable);
    });
  };
};
export { initAdminTableToggle };
