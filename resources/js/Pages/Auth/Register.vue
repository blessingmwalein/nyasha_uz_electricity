<script setup>
import { Head, Link, useForm } from '@inertiajs/vue3';
import AuthenticationCard from '@/Components/AuthenticationCard.vue';
import AuthenticationCardLogo from '@/Components/AuthenticationCardLogo.vue';
import Checkbox from '@/Components/Checkbox.vue';
import InputError from '@/Components/InputError.vue';
import InputLabel from '@/Components/InputLabel.vue';
import PrimaryButton from '@/Components/PrimaryButton.vue';
import TextInput from '@/Components/TextInput.vue';

const form = useForm({
    name: '',
    email: '',
    password: '',
    password_confirmation: '',
    terms: false,
});

const submit = () => {
    form.post(route('register'), {
        onFinish: () => form.reset('password', 'password_confirmation'),
    });
};
</script>

<template>
    <div>
        <div class="px-5 py-5 p-lg-0 h-screen bg-surface-secondary d-flex flex-column justify-content-center">
            <div class="d-flex justify-content-center">
                <div
                    class="col-12 col-md-9 col-lg-6 min-h-lg-screen d-flex flex-column justify-content-center py-lg-16 px-lg-20 position-relative">
                    <div class="row">
                        <div class="col-lg-10 col-md-9 col-xl-7 mx-auto">
                            <div class="text-center mb-12">
                                <h1 class="ls-tight font-bolder mt-6">Create your account</h1>
                            </div>
                            <form @submit.prevent="submit">
                                <div class="mb-5">
                                    <label class="form-label" for="name">Name</label>
                                    <input type="text" class="form-control" v-model="form.name" id="name"
                                        placeholder="Enter your name">
                                    <InputError class="mt-2" :message="form.errors.name" />

                                </div>
                                <div class="mb-5">
                                    <label class="form-label" for="email">Email address</label>
                                    <input type="email" v-model="form.email" class="form-control" id="email"
                                        placeholder="Your email address">
                                    <InputError class="mt-2" :message="form.errors.email" />

                                </div>
                                <div class="mb-5">
                                    <label class="form-label" for="password">Password</label>
                                    <input type="password" v-model="form.password" class="form-control" id="password"
                                        placeholder="Password" autocomplete="current-password">
                                    <InputError class="mt-2" :message="form.errors.password" />

                                </div>
                                <div class="mb-5">
                                    <label class="form-label" for="password">Password Confirmation</label>
                                    <input type="password" v-model="form.password_confirmation" class="form-control"
                                        id="password" placeholder="Password" autocomplete="current-password">

                                    <InputError class="mt-2" :message="form.errors.password_confirmation" />
                                </div>

                                <div><Button :class="{ 'opacity-25': form.processing }" :disabled="form.processing"
                                        class="btn btn-primary w-full">Register</Button></div>
                            </form>
                            <div class="py-5 text-center"><span class="text-xs text-uppercase font-semibold">or</span>
                            </div>

                            <div class="my-6">
                                <Link :href="route('login')"
                                    class="underline text-sm text-gray-600 hover:text-gray-900 rounded-md focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500">
                                Already registered?
                                </Link>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>
