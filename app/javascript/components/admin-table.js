
  let adminBanner = document.getElementById('admin-banners')
  let adminCounter = document.getElementById('admin-counter')
  let adminLogos = document.getElementById('admin-logos')
  let adminVerbatims = document.getElementById('admin-verbatims')
  let adminRealisations = document.getElementById('admin-realisations')
  let adminArticles = document.getElementById('admin-articles')

const initAdminTableToggle = () => {
 if(adminBanner || adminCounter || adminLogos || adminVerbatims || adminRealisations || adminRealisations || adminArticles) {
  function logItem(e) {
    const item = document.querySelector(`[data-id=${e.target.id}]`);
    item.toggleAttribute('hidden');
  }

  const tables = document.querySelector('[id^="admin-table-"]').id;

  tables.forEach((table) => {
    table.addEventListener('toggle', logItem);
  });
};
};


export { initAdminTableToggle };
