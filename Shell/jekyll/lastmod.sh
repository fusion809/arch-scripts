function lmod {
  prevmod=$(sed -n 's/last_modified_at:\s*//p' $1)
  lastmod=$(date -r $1 +'%Y-%m-%d %H:%M:%S %z')
  echo "prevmod is $prevmod\nlastmod is $lastmod"
  sed -i -e "s/last_modified_at: $prevmod/last_modified_at: $lastmod/g" $1
}

function lastmod {
  lastmod=$(date -r $1 +'%Y-%m-%d %H:%M:%S %z')
  echo $lastmod | xclip -sel clip
}
