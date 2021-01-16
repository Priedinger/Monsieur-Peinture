
  let adminBanner = document.getElementById('admin-banners')
  let adminCounter = document.getElementById('admin-counter')
  let adminLogos = document.getElementById('admin-logos')
  let adminVerbatims = document.getElementById('admin-verbatims')
  let adminRealisations = document.getElementById('admin-realisations')
  let adminArticles = document.getElementById('admin-articles')

const initAdminTableToggle = () => {
 if(adminBanner || adminCounter || adminLogos || adminVerbatims || adminRealisations || adminRealisations || adminArticles) {

  adminBanner.addEventListener("click", () => {
    let adminTableBanner = document.getElementById('admin-table-banners')
    adminTableBanner.classList.toggle("hidden");
  })
  adminCounter.addEventListener("click", () => {
    let adminTableCounter = document.getElementById('admin-table-counter')
    adminTableCounter.classList.toggle("hidden");
  })

  adminLogos.addEventListener("click", () => {
    let adminTableLogos = document.getElementById('admin-table-logos')
    adminTableLogos.classList.toggle("hidden");
  })

  adminVerbatims.addEventListener("click", () => {
    let adminTableVerbatims = document.getElementById('admin-table-verbatims')
    adminTableVerbatims.classList.toggle("hidden");
  })

  adminRealisations.addEventListener("click", () => {
    let adminTableRealisations = document.getElementById('admin-table-realisations')
    adminTableRealisations.classList.toggle("hidden");
  })

  adminArticles.addEventListener("click", () => {
    let adminTableArticles = document.getElementById('admin-table-articles')
    adminTableArticles.classList.toggle("hidden");
  })
};

};

export { initAdminTableToggle };
