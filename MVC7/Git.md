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