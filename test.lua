svn = require "svn"

repo_path = "test_repo"
repo_url = "file://"..os.getenv("PWD").."/test_repo"
test_path = "test"
file_name = "test.file"
dir_name = "trunk"

dir = test_path.."/"..dir_name
file = dir .. "/" .. file_name
contents = { "content1", "content2" }
rev2content = {}

svn.repos_create(repo_path)
assert(svn.checkout(repo_url, test_path), "unable to checkout")
svn.mkdir(dir)
f = io.open(file,"w")
f:write(contents[1])
f:close()
svn.add(file)
t = svn.status(file)
assert(string.sub(t[file],1,1) == "A", "file not correctly added: "..t[file])
r1 = svn.commit(test_path)
rev2content[r1] = contents[1]
f = io.open(file,"w")
f:write(contents[2])
f:close()
t = svn.status(file)
assert(string.sub(t[file],1,1) == "M", "file not listed as modified")
r2 = svn.commit(file)
rev2content[r2]=contents[2]
t = svn.list(repo_url)
for k in pairs(t) do
	print(k)
end
h = svn.log (file)
for rev, v in pairs(h) do
	assert(svn.cat(file, rev) == rev2content[rev])
	print(rev)
	for k,v in pairs(v) do
		print(k,v)
	end
end
svn.cleanup(test_path)
svn.repos_delete(repo_path)
