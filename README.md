# Deploy to Branch <small>for GitHub Pages</small>

This is a small GitHub Action Step for pushing a folder into a branch. You just need to specify the source folder, target branch, commit message, author name and email for everything to work.

Here is a quick example that you can use for pushing the entire branch to `gh-pages`:

```yaml
jobs:
  deploy-to-pages:
    runs-on: ubuntu-18.04
    steps:
      - name: Checkout latest commit
        uses: actions/checkout@master
      - name: Push everything to gh-pages
        uses: FullDiveCollective/DeployToBranch@master
        with:
          token: ${{ secrets.ACCESS_TOKEN }}
```

For all of the options available, please check the `inputs` section on [action.yml](action.yml).
