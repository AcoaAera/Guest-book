<template>
    <v-app>
        <TheHeader></TheHeader>
        <v-main class="blue-grey lighten-5" style="min-height: 100vh">
            <v-container>
                <router-view></router-view>
            </v-container>
        </v-main>
    </v-app>
</template>

<script>
import TheHeader from "./TheHeader.vue";
export default {
    components: { TheHeader },
};
</script>

<style></style>
