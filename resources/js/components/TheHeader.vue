<template>
    <v-navigation-drawer app permanent>
        <v-list>
            <v-list-item @click="$router.push({ name: 'index' })">
                <v-list-item-content>
                    <v-list-item-title class="text-h6">
                        Название сайта
                    </v-list-item-title>
                </v-list-item-content>
            </v-list-item>
        </v-list>

        <v-divider></v-divider>

        <v-list nav dense>
            <v-list-item link :to="{ name: 'add-message' }">
                <v-list-item-icon>
                    <v-icon>mdi-pencil-plus</v-icon>
                </v-list-item-icon>
                <v-list-item-title>Добавить сообщение</v-list-item-title>
            </v-list-item>
            <v-list-item link :to="{ name: 'history' }">
                <v-list-item-icon>
                    <v-icon>mdi-archive</v-icon>
                </v-list-item-icon>
                <v-list-item-title>История</v-list-item-title>
            </v-list-item>
        </v-list>
    </v-navigation-drawer>
</template>
