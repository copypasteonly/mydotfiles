local workspace_dir = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
local config = {
  cmd = {
    "java",
    "-Declipse.application=org.eclipse.jdt.ls.core.id1",
    "-Dosgi.bundles.defaultStartLevel=4",
    "-Declipse.product=org.eclipse.jdt.ls.core.product",
    "-Dlog.level=ALL",
    "-noverify",
    "-Xmx1G",
    "-jar",
    "/home/denzel/Library/java/jdt-language-server-1.9.0-202203031534/plugins/org.eclipse.equinox.launcher_1.6.400.v20210924-0641.jar",
    "-configuration",
    "/home/denzel/Library/java/jdt-language-server-1.9.0-202203031534/config_linux/",
    "-data",
    vim.fn.expand("~/.cache/jdtls-workspace/") .. workspace_dir,
    "--add-modules=ALL-SYSTEM",
    "--add-opens java.base/java.util=ALL-UNNAMED",
    "--add-opens java.base/java.lang=ALL-UNNAMED"
  },
  -- Here you can configure eclipse.jdt.ls specific settings
  -- See https://github.com/eclipse/eclipse.jdt.ls/wiki/Running-the-JAVA-LS-server-from-the-command-line#initialize-request
  -- for a list of options
  settings = {
    java = {}
  },
  root_dir = require("jdtls.setup").find_root({".git", "mvnw", "gradlew"}),
}
require("jdtls").start_or_attach(config)
