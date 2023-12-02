/*!
* Start Bootstrap - Creative v7.0.7 (https://startbootstrap.com/theme/creative)
* Copyright 2013-2023 Start Bootstrap
* Licensed under MIT (https://github.com/StartBootstrap/startbootstrap-creative/blob/master/LICENSE)
*/
//
// Scripts
// 



/*
[ChatGPT 질의 결과]
부트스트랩 및 JavaScript를 사용하여 웹 페이지의 네비게이션 및 사용자 경험을 향상시키기 위한 몇 가지 기능을 구현하는 데 사용됩니다.

1. window.addEventListener('DOMContentLoaded', event => { ... });
: 이 코드는 페이지가 로드될 때 실행될 함수를 등록하는 이벤트 리스너입니다.
페이지가 완전히 로드되었을 때 이벤트가 발생하며, 함수 내의 작업이 이 시점에 실행됩니다.

2. navbarShrink 함수
: 이 함수는 네비게이션 바의 크기를 조절하는 역할을 합니다.
스크롤 위치에 따라 네비게이션 바의 스타일 클래스를 추가하거나 제거합니다.

3. document.addEventListener('scroll', navbarShrink);
: 이 코드는 페이지가 스크롤될 때 navbarShrink 함수를 호출하는 이벤트 리스너를 등록합니다.
스크롤 이벤트가 발생할 때마다 네비게이션 바의 크기를 업데이트하여 스크롤 위치에 따라 네비게이션 바가 축소 또는 확장됩니다.

4. new bootstrap.ScrollSpy(document.body, { ... });
: 이 코드는 부트스트랩의 ScrollSpy 기능을 활성화합니다.
스크롤 위치에 따라 해당 섹션이 하이라이트되는 효과를 제공합니다.

5. navbarToggler와 responsiveNavItems 관련 코드
: 이 부분은 반응형 네비게이션 바를 구현합니다.
navbarToggler는 네비게이션 바 토글 버튼을 나타내며, 사용자가 네비게이션 항목을 클릭할 때 토글 버튼이 활성화되어 있으면 자동으로 네비게이션 바를 접습니다.

6. new SimpleLightbox({ ... });
: 이 코드는 포트폴리오 항목을 위한 이미지 라이트박스 플러그인을 활성화합니다.
이 플러그인은 이미지를 확대하고 슬라이드쇼를 표시하는 데 사용됩니다.
*/