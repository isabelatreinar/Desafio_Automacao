
class BuscaPage < SitePrism::Page

  element :input_search,  '#query'
  element :btn_search,    '.btn.btn-sm.btn-default'
  element :alert_area,    '.alert.alert-danger'
  element :combo_type,    '#type'
  element :control_page,  '.pagination.pagination-lg'

  def acessar_page_busca
    visit 'https://opentdb.com/browse.php'
  end

end