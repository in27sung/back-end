Username: Insung
UserEmial: in27sung@gmail.com


* 깃 사용자 정보 등록 

> git config —global user.email “이메일주소”
> git config —global user.name “이름”

* 깃 상태 확인
> git status

* git 기초 개념 
repository: 저장소(관리되는 파일이 존재하는 공간)


untracked(상태): 저장소를 생성하는 순간 이후로 생성되는 모든 파일의 상태(관리 대상에서 제외된 파일)

tracked (상태): git 해당 대상(파일)을 관리 대상의 형태로 설정 (관리 대상으로 지정)

staged (상태): 정보를 저장할때 (commit 커밋) 생성되는 파일의 형태

* git add 파일명: 해당 파일을 관리대상으로 지정 
> git add octocat-1729576635489.png

* git commit -m “커밋 메시지”: 파일의 상태를 저장하는데 메시지 정보가 필요

> git log
> git log --oneline
> git log --oneline --all --graph

> git checkout 커밋아이디: 특정 커밋의 상태로 이동(돌아가는것)

> git checkout -: 방금전 커밋

> git checkout master

---------------------------------------------------------------------------------------------------------

* Git-2.47.0-64-bit.exe 프로그램 설치 ( 설치 맨 마지막 체크 다 해제 후 클릭)
* 바탕화면에 "git" 이름의 폴더 생성
* 폴더 안에서 shift + 우클릭 / git bash 실행

* 깃 저장소 초기화(숨김폴더 형태로 파일 생성) 
> git init

* 깃 사용자 정보 등록
> git config --global user.email "dkdgody2684@naver.com"
> git config --global user.name "yeeezin"

* 깃 상태 확인 
> git status

*git 기초 개념

- repository : 저장소(관리되는 파일이 존재하는 공간)

- untracked (상태) : 저장소를 생성하는 순간 이후로 생성되는 모든 파일의 상태 ( 관리 대상에서 제외된 파일 )

- tracked (상태) : git 해당 대상(파일)을 관리 대상의 형태로 설정 ( 관리 대상으로 지정 )

- staged (상태) : 정보를 저장할때 (commit 커밋) 생성되는 파일의 형태 

- unstaged (상태) : 관리대상X , staged 상태 X , 저장(commit) 할때 제외되는 파일

--------------------------------------------------------------------------------------------------------

** 방향키 위 누르면 이전꺼 자동 입력 됨 ** 
** 붙여넣기 shift + insert **

* git add 파일명 : 해당 파일을 관리대상으로 지정 
> git add 241022.txt   ** tab 누르면 자동입력 됨 ** 
> git status 

* git commit -m "커밋 메세지" : 파일의 상태를 저장하는데 메세지 정보가 필요 

> git commit -m "첫번째 커밋 작성완료!"
** -m : 메세지라는 뜻 ** 

* git log : 커밋(저장정보)의 기록 확인

> git log
> git log --oneline - 한줄로 
> git log --oneline --all --graph 

* git checkout 커밋 아이디 : 특정 커밋의 상태로 이동 ( 커밋 했을때로 돌아가는것 ) 
	** ex) 1. 야 2. 야호 ->  1번으로 돌아가면 야로 다시 돌아감 ** 

> git checkout 6f352b0 

> git checkout -  ( 방금전 커밋 )

> git checkout master 

*github / 프로필 클릭 / Your repository / new 클릭  /  new repository 
-> Repository name 에 gitTest6 적고 밑에 Description (optional)에 
깃허브 연습용 저장소입니다.  입력!! 그 다음 생성! 

* local( 내 컴퓨터 ) 에서 작업한 정보를 원격(github)에 올리는 작업

* git remote add origin 깃허브 주소 : 원격저장소 정보를 저장 ( 설정 ) 
> git remote add origin https://github.com/yeeezin/gitTest6.git
> git remote  ** origin이 떠야함 **

** ( git add * ) ** 사용 가능

* git push origin master : 원격저장소로 로컬에 작업해놓은 정보를 전송 
> git push origin master

>> Connect to GitHub 창 >> sign in with your browsergit

------------------------------------------------------------------------------------------------------------
- 집에서 원격저장소 파일 가져오기 gitHome
code 에 있는 주소 복사 https://github.com/yeeezin/gitTest6.git    


** gitHome 폴더 생성 ** 
안에서 쉬프트 + 우클릭 후 bush 클릭

* git clone 깃허브 주소 : 해당 깃허브에서 프로젝트(파일)를 복사해오기(1회)
*** 주황색에 gitHome이라고 되어 있어야함 ***

>          ==> 통째로 파일을 받을 수 있음

------------ 3 ----------------
* git pull origin master : 원격저장소에 저장된 정보를 가져오기

> git pull origin master    /// git 에 가서 실행 시 그 폴더에 생김!




> git clone https://github.com/yeeezin/gitTest6.git
-------- 2 ----------
> cd gitTest6
> git status
> git add * 
> git commit -m"집에서 공부한 내용추가"




/* $ git log --oneline --all --graph
* 620ff17 (HEAD -> master) 집에서 공부한 내용추가
* 178ad68 (origin/master, origin/HEAD) BoardFrontController 파일추가
* 3cebd21 원격저장소로 전달
* 1a1968c 5번 커밋 : 오늘 일기 삭제
* 6f352b0 4번커밋 : 신규파일 생성!
* a10a0f0 세번째 커밋 - 내용추가
* ec73be3 두번째 커밋 - 파일내용 수정
* 3ec1287 첫번째 커밋 작성완료! */

---------------------------------------------------------------------------------------------------------

eclipse Git/GitHub 연동 

Project(right click) > Team > share 

- 파일을 생성, 수정, 삭제... 작업 처리 -> commit
- 원격 저장소로 전송 -> push
- 원격 저장소에서 변경사항 체크 -> 동기화(Synchronise)

1) 변동사항이 없을 때 -> 새로운 작업 실행 
2) 변동사항이 있을 때 -> 원격저장소에서 정보를 가져오기 -> pull


file pulling 
synchronise WorkSpace 



