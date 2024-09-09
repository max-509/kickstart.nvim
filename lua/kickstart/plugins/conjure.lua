return {
  {
    'Olical/conjure',
    dependencies = { 'PaterJason/cmp-conjure', },
  },
  {
    "PaterJason/cmp-conjure",
    config = function()
      local cmp = require("cmp")
      local config = cmp.get_config()
      table.insert(config.sources, { name = "conjure" })
      return cmp.setup(config)
    end,
  }
}
