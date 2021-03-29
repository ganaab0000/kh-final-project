<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>CK TEST</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">

<!-- <script
	src="https://cdn.ckeditor.com/ckeditor5/24.0.0/classic/ckeditor.js"></script> -->
<script src="/js/ck/ckeditor.js"></script>
<link href="/css/materialize.css" rel="stylesheet">
<link href="/css/ckeditor.css" rel="stylesheet">
<script>
        $(document).ready(function () {
            $('input#title').characterCounter();
            $('input#title').focus();
            // $('.datepicker').datepicker();
            $('.datepicker').datepicker({
                firstDay: true,
                format: 'yyyy-mm-dd',
                i18n: {
                    months: ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"],
                    monthsShort:  ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"],
                    weekdays: ["토", "일", "월", "화", "수", "목", "금"],
                    weekdaysShort: ["토", "일", "월", "화", "수", "목", "금"],
                    weekdaysAbbrev: ["토", "일", "월", "화", "수", "목", "금"]
                }
            });
            var headerName = '${_csrf.headerName}';
            var token = '${_csrf.token}';

            ClassicEditor
                .create(document.querySelector('.editor'), {
                	//plugins: [SimpleUploadAdapter],
                	//
                	placeholder: '내용을 적어주세요.',
/*             		ckfinder: {
            			uploadUrl: '/api/ckfile',

                        // Enable the XMLHttpRequest.withCredentials property.
                        withCredentials: true,

                        // Headers sent along with the XMLHttpRequest to the upload server.

                        headers: {
                        	headerName: token,
                        	etc: "adfadf",
                            'X-CSRF-TOKEN': token,
                            //Authorization: 'Bearer <JSON Web Token>'
                        }

            		}, */
                    simpleUpload: {
                        // The URL that the images are uploaded to.
                        uploadUrl: '/api/ckfile',

                        // Enable the XMLHttpRequest.withCredentials property.
                        withCredentials: true,

                        // Headers sent along with the XMLHttpRequest to the upload server.
                        headers: {
                            '${_csrf.headerName}': '${_csrf.token}',
                            Authorization: 'Bearer <JSON Web Token>'
						}
                    },
                    toolbar: {
                        items: [
                            'imageUpload',
                            'link',
                            'mediaEmbed',
                            'heading'
                        ]
                    },
                    language: 'ko',
                    image: {
                        toolbar: [
                            'imageTextAlternative',
                            'imageStyle:full',
                            'imageStyle:side'
                        ]
                    },
                    table: {
                        contentToolbar: [
                            'tableColumn',
                            'tableRow',
                            'mergeTableCells'
                        ]
                    },
                    licenseKey: '',

                })
                .then(editor => {
                    window.editor = editor;
                })
                .catch(error => {
                    console.error('Oops, something went wrong!');
                    console.error('Please, report the following error on https://github.com/ckeditor/ckeditor5/issues with the build id and the error stack trace:');
                    console.warn('Build id: tuwzmyza2ddc-5ksw9ldcda3s');
                    console.error(error);
                });
        });

    </script>
</head>

<body class="min-width-500">


	<div
		class="top-padding-20 bottom-padding-20 sticky-layer white z-index-10">
		<div class="row line-height-btn">
			<div class="col s0 m1"></div>
			<div class="col s3 m5 teal-text font-size-20">
				<i class="material-icons">image</i> 텀블벅
			</div>
			<div class="col s9 m5 right-align ">
				<span
					class="waves-effect waves-teal btn-flat right-margin-10 teal-text"><i
					class="material-icons">done</i> 완료</span> <span
					class="waves-effect waves-teal btn-flat right-margin-10"><i
					class="material-icons">help_outline</i> 사용법</span> <span
					class="waves-effect waves-teal btn-flat right-margin-10"><i
					class="material-icons">account_circle</i> 계정명</span>
			</div>
			<div class="col s0 m1"></div>
		</div>
	</div>


	<div class="row">
		<div class="col s0 m1"></div>
		<div class="col s12 m10">

			<div class="row">
				<form class="col s12">
					<div class="row">
						<div class="input-field col s12">
							<input id="title" class="teal-text" type="text" data-length="30">
							<label for="title">프로젝트 제목</label>
						</div>

						<div class="input-field col s12">
							<input id="title" class="teal-text" type="number"
								data-length="30"> <label for="title">목표 금액</label>
						</div>
						<div class="input-field col s12">
							<input id="datetime" type="text" class="datepicker teal-text">
							<label for="datetime">목표 일자</label>
						</div>
						<!-- <div class="input-field col s12 m6">
                            <input id="datetime" type="text" class="datepicker">
                            <label for="datetime">일정 끝</label>
                        </div> -->
					</div>

					<div class="editor">
						<h2>Bilingual Personality Disorder</h2>
						<figure class="media ck-widget" contenteditable="false">
							<div class="ck-media__wrapper"
								data-oembed-url="https://www.youtube.com/watch?v=1yXZIFYv4SE">
								<div
									style="position: relative; padding-bottom: 100%; height: 0; padding-bottom: 56.2493%;">
									<iframe src="https://www.youtube.com/embed/1yXZIFYv4SE"
										style="position: absolute; width: 100%; height: 100%; top: 0; left: 0;"
										frameborder="0" allow="autoplay; encrypted-media"
										allowfullscreen=""></iframe>
								</div>
							</div>
							<div class="ck ck-reset_all ck-widget__type-around">
								<div
									class="ck ck-widget__type-around__button ck-widget__type-around__button_before"
									title="Insert paragraph before block">
									<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 10 8">
                                        <path
											d="M9.055.263v3.972h-6.77M1 4.216l2-2.038m-2 2l2 2.038"></path>
                                    </svg>
								</div>
								<div
									class="ck ck-widget__type-around__button ck-widget__type-around__button_after"
									title="Insert paragraph after block">
									<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 10 8">
                                        <path
											d="M9.055.263v3.972h-6.77M1 4.216l2-2.038m-2 2l2 2.038"></path>
                                    </svg>
								</div>
								<div class="ck ck-widget__type-around__fake-caret"></div>
							</div>
						</figure>
						<figure class="image image-style-side">
							<img
								src="https://c.cksource.com/a/1/img/docs/sample-image-bilingual-personality-disorder.jpg">
							<figcaption>One language, one person.</figcaption>
						</figure>
						<p>
							This may be the first time you hear about this made-up disorder
							but it actually isn’t so far from the truth. Even the studies
							that were conducted almost half a century show that <strong>the
								language you speak has more effects on you than you realise</strong>.
						</p>
						<p>
							One of the very first experiments conducted on this topic dates
							back to 1964. <a
								href="https://www.researchgate.net/publication/9440038_Language_and_TAT_content_in_bilinguals">In
								the experiment</a> designed by linguist Ervin-Tripp who is an
							authority expert in psycholinguistic and sociolinguistic studies,
							adults who are bilingual in English in French were showed series
							of pictures and were asked to create 3-minute stories. In the end
							participants emphasized drastically different dynamics for
							stories in English and French.
						</p>
						<p>
							Another ground-breaking experiment which included bilingual
							Japanese women married to American men in San Francisco were
							asked to complete sentences. The goal of the experiment was to
							investigate whether or not human feelings and thoughts are
							expressed differently in <strong>different language
								mindsets</strong>.
							<Here>is a sample from the the experiment:</Here>
						</p>
						<table>
							<thead>
								<tr>
									<th></th>
									<th>English</th>
									<th>Japanese</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>Real friends should</td>
									<td>Be very frank</td>
									<td>Help each other</td>
								</tr>
								<tr>
									<td>I will probably become</td>
									<td>A teacher</td>
									<td>A housewife</td>
								</tr>
								<tr>
									<td>When there is a conflict with family</td>
									<td>I do what I want</td>
									<td>It's a time of great unhappiness</td>
								</tr>
							</tbody>
						</table>
						<p>
							More recent <a
								href="https://books.google.pl/books?id=1LMhWGHGkRUC">studies</a>
							show, the language a person speaks affects their cognition,
							behaviour, emotions and hence <strong>their personality</strong>.
							This shouldn’t come as a surprise <a
								href="https://en.wikipedia.org/wiki/Lateralization_of_brain_function">since
								we already know</a> that different regions of the brain become more
							active depending on the person’s activity at hand. Since
							structure, information and especially <strong>the
								culture</strong> of languages varies substantially and the language a
							person speaks is an essential element of daily life.
						</p>
					</div>
				</form>
			</div>


		</div>
		<div class="col s0 m1"></div>
	</div>



</body>

</html>