<template>
    <v-form
        v-model="valid"
        lazy-validation
        @submit.prevent="validate"
        ref="formFeedback"
    >
        <v-card class="mx-auto" max-width="500">
            <v-card-title><b>Форма обратной связи</b></v-card-title>
            <v-divider class="mx-4"></v-divider>
            <v-card-text>
                <v-text-field
                    v-model="feedback.user_name"
                    :counter="50"
                    :rules="nameRules"
                    label="Ваше имя"
                    required
                ></v-text-field>

                <v-text-field
                    v-model="feedback.email"
                    :rules="emailRules"
                    label="Ваша почта"
                    required
                ></v-text-field>
                <v-textarea
                    :counter="1000"
                    v-model="feedback.comment"
                    :rules="commentRules"
                    label="Ваш комментарий"
                    required
                ></v-textarea>
                <MyCaptcha
                    v-model="captcha"
                    required
                    ref="myCaptcha"
                ></MyCaptcha>
            </v-card-text>

            <v-card-actions>
                <v-btn text color="teal accent-4" type="submit">
                    Отправить
                </v-btn>
                <v-spacer></v-spacer>
                <v-btn text color="error" class="mr-4" @click="reset">
                    Очистить форму
                </v-btn>
            </v-card-actions>
        </v-card>
    </v-form>
</template>

<script>
import MyCaptcha from "../components/MyCaptcha.vue";
export default {
    components: { MyCaptcha },
    data: () => ({
        valid: true,
        captcha: null,
        feedback: {
            user_name: null,
            email: null,
            comment: null,
        },
        nameRules: [
            (v) => !!v || "Имя обязательно",
            (v) => (v && v.length <= 50) || "Имя не более 50 символов",
        ],
        emailRules: [
            (v) => !!v || "Почта обязательна",
            (v) => /.+@.+\..+/.test(v) || "Проверьте корректность почты",
        ],
        commentRules: [
            (v) => !!v || "Комментарий обязателен",
            (v) => {
                const pattern = /<(\"[^\"]*\"|'[^']*'|[^'\">])*>/;
                return (
                    !pattern.test(v) ||
                    "Комментарий не должен содержать HTML теги."
                );
            },
        ],
    }),

    methods: {
        validate() {
            this.$refs.myCaptcha
                .validateCaptcha()
                .then(() => {
                    if (this.$refs.formFeedback.validate()) {
                        axios.post("api/feedbacks", this.feedback);
                    } else {
                        alert("Проверь корректность заполненных полей");
                    }
                })
                .catch();
        },
        reset() {
            this.$refs.formFeedback.reset();
        },
    },
};
</script>
