<script setup>
import { Head, Link, useForm } from '@inertiajs/vue3';
import AuthenticationCard from '@/Components/AuthenticationCard.vue';
import AuthenticationCardLogo from '@/Components/AuthenticationCardLogo.vue';
import Checkbox from '@/Components/Checkbox.vue';
import InputError from '@/Components/InputError.vue';
import InputLabel from '@/Components/InputLabel.vue';
import PrimaryButton from '@/Components/PrimaryButton.vue';
import TextInput from '@/Components/TextInput.vue';

defineProps({
    canResetPassword: Boolean,
    status: String,
});

const form = useForm({
    email: '',
    password: '',
    remember: false,
});

const submit = () => {
    form.transform(data => ({
        ...data,
        remember: form.remember ? 'on' : '',
    })).post(route('login'), {
        onFinish: () => form.reset('password'),
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
                                <h3 class="display-5">👋</h3>
                                <h1 class="ls-tight font-bolder mt-6">Welcome back!</h1>
                                <p class="mt-2">Login</p>
                            </div>
                            <form @submit.prevent="submit">
                                <div v-if="status" class="mb-4 font-medium text-sm text-green-600">
                                    {{ status }}
                                </div>

                                <div class="mb-5">
                                    <label class="form-label" for="email">Email address</label>
                                    <input v-model="form.email" type="email" class="form-control" id="email"
                                        placeholder="Your email address">
                                    <InputError class="mt-2" :message="form.errors.email" />

                                </div>
                                <div class="mb-5">

                                    <div>
                                        <label class="form-label" for="password">Password</label>
                                    </div>
                                    <input v-model="form.password" type="password" class="form-control" id="password"
                                        placeholder="Password" autocomplete="current-password">
                                    <InputError class="mt-2" :message="form.errors.password" />

                                </div>
                                <div class="mb-5">
                                    <div class="form-check">
                                        <Checkbox v-model:checked="form.remember" name="remember" />
                                        <span class="ms-2 text-sm text-gray-600">Remember me</span>
                                    </div>
                                </div>
                                <div>
                                    <Button href="#" class="btn btn-primary w-full"
                                        :class="{ 'opacity-25': form.processing }" :disabled="form.processing">Sign
                                        in</Button>
                                </div>
                            </form>
                            <div class="py-5 text-center"><span class="text-xs text-uppercase font-semibold">or</span>
                            </div>

                            <Link :href="route('register')"
                                class="underline text-sm text-gray-600 hover:text-gray-900 rounded-md focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500">
                            Create an account
                            </Link>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>
