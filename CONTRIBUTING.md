# Contributing

## Bottles
Create a pull request.
Wait until the pull request’s checks become green.
Then label your pull request with the `pr-pull` label.
A new brew pr-pull workflow will be fired up and after a couple of minutes you should observe the PR closed, bottles uploaded and commits pushed to the master branch of your repository.

## Manual bottle build
GitHub actions supports only Catalina and Big Sur MacOS runners.
In case you want to populate release with manually prebuilt bottles:
1. Install and prepare the formula for eventual bottling `brew install --verbose --build-bottle tofuutils/tap/tofuenv`
2. Generate a bottle `brew bottle --verbose --json tofuutils/tap/tofuenv`
3. Upload bottle tar gz to release page in GitHub
4. Add sha256 of your bottle tar gz to the `bottle` section in formula file
5. Commit to master branch
