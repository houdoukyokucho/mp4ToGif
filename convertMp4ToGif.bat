@echo off

for %%f in (*.mp4) do (
	echo %%~nf
	ffmpeg -i "%%~nf.mp4" -filter_complex "[0:v] fps=10,scale=640:-1,split [a][b];[a] palettegen [p];[b][p] paletteuse" "%%~nf.gif"
	del "%%~nf.mp4"
)
rem 「*.mp4」ファイルを変数「%%f」が一つずつ受け取る
rem 「%%f」の間にある「~n」は拡張子を指定せずファイル名だけにする
rem 「cmd /k」これはバッチファイルを起動後もコマンドプロンプトを閉じない