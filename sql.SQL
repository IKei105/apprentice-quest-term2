ステップ3
1.よく見られているエピソードを知りたいです。エピソード視聴数トップ3のエピソードタイトルと視聴数を取得してください
SELECT t.TitleName AS タイトル名, v.viewCount AS 視聴回数
FROM Title AS t
INNER JOIN ViewCount AS v
ON t.ID = v.TitleID
ORDER BY ViewCount DESC
LIMIT 3;

2.よく見られているエピソードの番組情報やシーズン情報も合わせて知りたいです。エピソード視聴数トップ3の番組タイトル、シーズン数、エピソード数、エピソードタイトル、視聴数を取得してください
SELECT t.TitleName AS タイトル名, v.viewCount AS 視聴回数, s.SeasonNumber AS シーズン数, e.EpisodeNumber AS エピソード数,
e.EpisodeTitle AS エピソードタイトル
FROM Title AS t
INNER JOIN ViewCount AS v ON t.ID = v.TitleID
INNER JOIN Season AS s  ON t.ID = s.TitleID
INNER JOIN Episode AS e ON t.ID = e.TitleID
ORDER BY ViewCount DESC
LIMIT 3;

3.本日の番組表を表示するために、本日、どのチャンネルの、何時から、何の番組が放送されるのかを知りたいです。本日放送される全ての番組に対して、チャンネル名、放送開始時刻(日付+時間)、放送終了時刻、シーズン数、エピソード数、エピソードタイトル、エピソード詳細を取得してください。なお、番組の開始時刻が本日のものを本日方法される番組とみなすものとします
SELECT ch.ChannelName AS チャンネル名, CONCAT(b.Date, '-', st.StarTime) AS 放送開始時間, en.EndTime AS 放送終了時間,
s.SeasonNumber AS シーズン数, e.EpisodeNumber AS エピソード数, e.EpisodeTitle AS エピソードタイトル, e.EpisodeDetail AS エピソード詳細
FROM Title AS t
INNER JOIN Season AS s  ON t.ID = s.TitleID
INNER JOIN Episode AS e ON t.ID = e.TitleID
INNER JOIN BroadcastDate AS b ON b.ID = t.BroadcastDateID
INNER JOIN Program AS p ON t.ID = p.TitleID
INNER JOIN StartTime AS st ON st.ID = p.StartTimeID
INNER JOIN EndTime AS en ON en.ID = p.EndTimeID
INNER JOIN Channel AS ch ON ch.ID = p.ChannelID
WHERE b.Date = '2024-10-11'
ORDER BY b.Date DESC;

4.ドラマというチャンネルがあったとして、ドラマのチャンネルの番組表を表示するために、本日から一週間分、何日の何時から何の番組が放送されるのかを知りたいです。ドラマのチャンネルに対して、放送開始時刻、放送終了時刻、シーズン数、エピソード数、エピソードタイトル、エピソード詳細を本日から一週間分取得してください
SELECT CONCAT(b.`Date`, ' ', st.StarTime) AS 放送開始時間, en.EndTime AS 放送終了時間, s.SeasonNumber AS シーズン数, e.EpisodeNumber AS エピソード数, e.EpisodeTitle AS エピソードタイトル, e.EpisodeDetail AS エピソード詳細
FROM Title AS t
INNER JOIN Season AS s ON t.ID = s.TitleID
INNER JOIN Episode AS e ON t.ID = e.TitleID
INNER JOIN BroadcastDate AS b ON b.ID = t.BroadcastDateID
INNER JOIN Program AS p ON t.ID = p.TitleID
INNER JOIN StartTime AS st ON st.ID = p.StartTimeID
INNER JOIN EndTime AS en ON en.ID = p.EndTimeID
INNER JOIN Channel AS ch ON ch.ID = p.ChannelID 
WHERE ch.ChannelName = 'チャンネル4' AND 
      b.`Date` BETWEEN '2023-08-15' AND '2024-12-31'; --任意で書き換え--


5(advance) 直近一週間で最も見られた番組が知りたいです。直近一週間に放送された番組の中で、エピソード視聴数合計トップ2の番組に対して、番組タイトル、視聴数を取得してください
SELECT t.TitleName AS タイトル名, v.ViewCount AS 視聴回数
FROM ViewCount AS v
INNER JOIN Title AS t
ON t.ID = v.TitleID
INNER JOIN Program AS p
ON t.ID = p.TitleID
INNER JOIN BroadcastDate AS b
ON b.ID = p.BroadcastDateID
WHERE b.Date BETWEEN '2024-04-25' AND '2024-08-31' --任意で書き換え--
ORDER BY v.ViewCount DESC
LIMIT 2;

6(advance)ジャンルごとの番組の視聴数ランキングを知りたいです。番組の視聴数ランキングはエピソードの平均視聴数ランキングとします。ジャンルごとに視聴数トップの番組に対して、ジャンル名、番組タイトル、エピソード平均視聴数を取得してください。
--わかりませんでした--



