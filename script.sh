start="2026-02-01"
end="2026-04-30"

current="$start"

while [ "$(date -d "$current" +%Y%m%d)" -le "$(date -d "$end" +%Y%m%d)" ]
do
  echo "Commit on $current" >> file.txt

  GIT_AUTHOR_DATE="$current 12:00:00" GIT_COMMITTER_DATE="$current 12:00:00" git add .
  GIT_AUTHOR_DATE="$current 12:00:00" GIT_COMMITTER_DATE="$current 12:00:00" git commit -m "Commit for $current"

  current=$(date -d "$current + 1 day" +"%Y-%m-%d")
done
