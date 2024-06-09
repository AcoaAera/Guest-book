<template>
    <v-card>
        <v-card-title>История обратной связи</v-card-title>
        <v-card-text>
            <v-data-table
                :headers="headers"
                :items="feedbacks"
                :items-per-page="5"
                class="elevation-1"
                :sort-by="['created_at']"
                :sort-desc="[true]"
                multi-sort
            ></v-data-table></v-card-text
    ></v-card>
</template>

<script>
export default {
    data() {
        return {
            headers: [
                { text: "ID", value: "id", sortable: true },
                {
                    text: "Имя пользователя",
                    value: "user_name",
                    sortable: true,
                },
                { text: "E-mail", value: "email", sortable: true },
                { text: "Обратная связь", value: "comment", sortable: false },
                { text: "IP", value: "ip", sortable: false },
                { text: "Браузер", value: "browser", sortable: false },
                { text: "Дата создания", value: "created_at", sortable: true },
            ],
            feedbacks: [],
        };
    },
    mounted() {
        axios.get("api/feedbacks").then((res) => {
            this.feedbacks = res.data.result;
        });
        axios.get("api/fetchCapture").then().catch();
    },
};
</script>

<style></style>
