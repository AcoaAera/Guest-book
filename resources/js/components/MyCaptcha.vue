<template>
    <div>
        <v-row>
            <v-col class="col-8">
                <img :src="captchaImgSrc" width="inherit" />
            </v-col>
            <v-col class="d-flex align-center col-2">
                <v-btn icon color="green" @click="getCaptha">
                    <v-icon>mdi-cached</v-icon>
                </v-btn>
            </v-col>
        </v-row>
        <v-text-field
            v-model="captcha"
            label="Код, изображенный на картинке"
            required
            :rules="rules"
            @input="returnValue"
            :error-messages="errorMessages"
            :error="!validate"
        >
        </v-text-field>
    </div>
</template>

<script>
export default {
    mounted() {
        this.getCaptha();
    },
    data: () => ({
        captcha: null,
        captchaImgSrc: null,
        rules: [(v) => !!v || "Поле обязатльно для заполнения"],

        validate: true,
        errorMessages: "",
    }),
    props: {
        value: {
            type: String | null,
            required: true,
        },
    },
    methods: {
        getCaptha() {
            this.captchaImgSrc =
                "http://127.0.0.1:8000/api/fetchCapture?r" +
                new Date().getUTCMilliseconds();
        },
        returnValue() {
            this.$emit("input", this.captcha);
        },
        validateCaptcha() {
            return new Promise((resolve, reject) => {
                axios
                    .post("api/validateCaptcha", { captcha: this.captcha })
                    .then(() => {
                        this.validate = true;
                        return resolve();
                    })
                    .catch((er) => {
                        this.refresh();
                        this.validate = false;
                        this.errorMessages = er.response.data.details;
                        return reject(er.response.data);
                    });
            });
        },
        refresh() {
            this.captcha = null;
            this.getCaptha();
        },
    },
};
</script>

<style></style>
