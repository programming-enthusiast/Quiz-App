angular.module('quiz')
    .controller('PlayCtrl', ['$scope', '$http',
        function ($scope, $http) {

            console.log('$scope: ', $scope)
            console.log('$http: ', $http)
            $scope.quiz = [];
            var rightAnswers = 0;

            var getQuizId = function () {
                var pathname = window.location.pathname.split("/");

                return pathname[pathname.length - 1];
            };

            $http.get(getQuizId() + '.json').then(function (response) {
                $scope.quiz = response.data;
            });

            $scope.score = 0;
            $scope.showScore = false;

            var showScore = function () {
                $scope.showScore = true;
                $scope.score = 100 / $scope.quiz.questions.length * rightAnswers;
                $.post('/scores', { score: { quiz_id : $scope.quiz.id, score: $scope.score } },
                    function(returnedData){
                        console.log(returnedData);
                    });
            };

            $scope.currentQuestion = 0;

            $scope.nextQuestion = function (answer) {
                if (answer.correct == true) {
                    rightAnswers = rightAnswers + 1;
                }

                if ($scope.quiz.questions.length == ($scope.currentQuestion + 1)) {
                    $scope.currentQuestion = null;
                    showScore();

                } else {
                    $scope.currentQuestion = $scope.currentQuestion + 1;
                }
            };

            $scope.retryQuiz = function () {
                location.reload();
            };
        }]);
