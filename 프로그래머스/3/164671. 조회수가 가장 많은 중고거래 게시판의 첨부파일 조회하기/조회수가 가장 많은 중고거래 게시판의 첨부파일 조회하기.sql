-- 코드를 입력하세요
SELECT ('/home/grep/src/'||f.board_id||'/'||f.file_id||f.file_name||f.file_ext) AS FILE_PATH
from USED_GOODS_BOARD B, USED_GOODS_FILE F
where B.BOARD_ID=F.BOARD_ID
AND B.BOARD_ID IN
(SELECT board_id
FROM USED_GOODS_BOARD
WHERE views = (SELECT MAX(views) FROM USED_GOODS_BOARD))
order by F.FILE_ID DESC;