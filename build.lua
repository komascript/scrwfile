#!/usr/bin/env texlua

--[[
  Build script for scrwfile project
  Copyright (c) 2023 Markus Kohm

  This file is part of the build system of scrwfile..

  It may be distributed and/or modified under the conditions of the
  LaTeX Project Public License (LPPL), either version 1.3c of this
  license or (at your option) any later version.  The latest version
  of this license is in the file

    https://www.latex-project.org/lppl.txt
]]

release_info = "2023-04-01 v0.1.99"
-- Bundle and modules

module       = "scrwfile"

unpackfiles  = { "scrwfile.dtx" }

installfiles = { "scrwfile.sty" }

-- Package

packtdszip   = false

-- CTAN information

ctanpkg   = "scrwfile"

uploadconfig = {
  pkg         = "scrwfile",
  version     = release_info,
  author      = "Markus Kohm",
  license     = "lppl1.3c",
  summary     = "Use LaTeX .aux file in place of \\newrite files",
  topic       = "io-mgmt",
  ctanPath    = "/macros/latex/contrib/scrwfile",
  bugtracker  = "https://github.com/komascript/scrwfile/issues",
  home        = "https://github.com/komascript/scrwfile",
  repository  = "https://github.com/komascript/scrwfile.git",
}

-- Typesetting

typesetruns  = 5

-- Detail how to set the version automatically
-- Example: `l3build tag --date 2023-03-31 v0.3'

tagfiles = {"*.dtx","README.md","build.lua"}

function update_tag (file,content,tagname,tagdate)
   tagname = string.gsub (tagname, "v(%d+%.%d+)", "%1")
   
   if string.match (file, "%.dtx$") then
      return string.gsub (content,
                          "%[%d%d%d%d%-%d%d%-%d%d v[%d%.]*%d+",
                          "[" .. tagdate .. " v" .. tagname )
   elseif string.match (file, "%.md$") then
      return string.gsub (content,
                          "\nRelease: %d%d%d%d%-%d%d%-%d%d v[%d%.]*%d+  \n",
                          "\nRelease: " .. tagdate .. " v" .. tagname .. "  \n")
   elseif string.match (file, "%.lua$") then
      return string.gsub (content,
                          '\nrelease_info%s*=%s*"%d%d%d%d%-%d%d%-%d%d%s*v[%d%.]*%d+"%s*\n',
                          '\nrelease_info = "' .. tagdate .. " v" .. tagname .. '"\n')
   end
   return content
end

-- Find and run build system

kpse.set_program_name("kpsewhich")
if not release_date then
  dofile(kpse.lookup("l3build.lua"))
end
