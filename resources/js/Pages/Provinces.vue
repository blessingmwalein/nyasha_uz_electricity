<script>
import AppLayout from '@/Layouts/AppLayout.vue';
import Welcome from '@/Components/Welcome.vue';
import { Head, Link, useForm } from '@inertiajs/vue3';


export default {
    components: {
        AppLayout,
        Welcome,
    },

    props: ['provinces'],

    data() {
        return {
            form: useForm({
                name: '',
                number_of_clients: 0,
                number_of_cities: 0,
                number_of_districts: 0,
                number_of_towns: 0,
            }),

            selectedProvince: null,

        }
    },

    methods: {
        submit() {
            if (this.selectedProvince) {
                this.form.put(`provinces/${this.selectedProvince.id}`, {
                    onSuccess: () => {
                        this.form.reset();
                        this.selectedProvince = null;
                        this.$emit('refresh');
                    }
                });
            } else {
                this.form.post('provinces', {
                    onSuccess: () => {
                        this.form.reset();
                        this.$emit('refresh');
                    }
                });
            }
        },

        deleteProvince(province) {
            this.$inertia.delete(`provinces/${province.id}`, {
                onSuccess: () => {
                    this.$emit('refresh');
                }
            });
        },

        edit(province) {
            this.selectedProvince = province;
            this.form.name = province.name;
            this.form.number_of_clients = province.number_of_clients;
            this.form.number_of_cities = province.number_of_cities;
            this.form.number_of_districts = province.number_of_districts;
            this.form.number_of_towns = province.number_of_towns;
        },


    }
}

</script>

<template>
    <AppLayout title="Dashboard">
        <header>
            <div class="container-fluid">
                <div class=" pt-6">
                    <div class="row align-items-center">
                        <div class="col-sm col-12">
                            <h1 class="h2 ls-tight">All Provinces</h1>
                        </div>
                        <div class="col-sm-auto col-12 mt-4 mt-sm-0">
                            <div class="hstack gap-2 justify-content-sm-end"><a href="#offcanvasCreate"
                                    class="btn btn-sm btn-primary" data-bs-toggle="offcanvas"><span class="pe-2"><i
                                            class="bi bi-plus-square-dotted"></i> </span><span>Create</span></a>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </header>
        <div class="offcanvas offcanvas-end w-full w-lg-1/3" data-bs-scroll="true" data-bs-backdrop="true" tabindex="-1"
            id="offcanvasCreate" aria-labelledby="offcanvasCreateLabel">
            <div class="offcanvas-header border-bottom py-4 bg-surface-secondary">
                <h5 class="offcanvas-title" id="offcanvasCreateLabel">{{ selectedProvince ? 'Update' : 'New' }} Province
                </h5><button type="button" class="btn-close text-reset text-xs" data-bs-dismiss="offcanvas"
                    aria-label="Close"></button>
            </div>
            <form @submit.prevent="submit()">

                <div class="offcanvas-body vstack gap-5">
                    <div class="row g-5">
                        <div class="col-md-6">
                            <div>
                                <label class="form-label">Name</label>
                                <input type="text" v-model="form.name" class="form-control">
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div>
                                <label class="form-label"># of Clients</label>
                                <input type="number" v-model="form.number_of_clients" class="form-control">
                            </div>
                        </div>
                    </div>

                    <hr>
                    <div class="row">
                        <div class="col-md-4">
                            <label class="form-label" for="last_name"># of Cities</label>
                            <input type="number" v-model="form.number_of_cities" class="form-control">
                        </div>
                        <div class="col-md-4">
                            <label class="form-label" for="last_name"># of Districts</label>
                            <input type="number" v-model="form.number_of_districts" class="form-control">
                        </div>
                        <div class="col-md-4">
                            <label class="form-label" for="last_name"># of Towns</label>
                            <input type="number" v-model="form.number_of_towns" class="form-control">
                        </div>
                    </div>
                </div>
                <div class="modal-footer py-2 bg-surface-secondary">
                    <button style="margin-right: 5px;" type="button" class="btn btn-sm btn-neutral"
                        data-bs-dismiss="offcanvas">Close</button>
                    <button type="submit" :class="{ 'opacity-25': form.processing }" :disabled="form.processing"
                        class="btn btn-sm btn-primary">Save</button>
                </div>
            </form>
        </div>

        <div class="container-fluid mt-4">
            <div class="vstack gap-4">

                <div class="card">
                    <div class="card-header border-bottom d-flex align-items-center">
                        <h5 class="me-auto">All provinces</h5>
                        <div class="dropdown"><a class="text-muted" href="#" role="button" data-bs-toggle="dropdown"
                                aria-haspopup="true" aria-expanded="false"><i class="bi bi-three-dots-vertical"></i></a>
                            <div class="dropdown-menu"><a href="#!" class="dropdown-item">Action </a><a href="#!"
                                    class="dropdown-item">Another action </a><a href="#!"
                                    class="dropdown-item">Something else here</a></div>
                        </div>
                    </div>
                    <div class="table-responsive">
                        <table class="table table-hover table-nowrap">
                            <thead class="table-light">
                                <tr>
                                    <th scope="col">Name</th>
                                    <th scope="col">Clients</th>
                                    <th scope="col">Cities</th>
                                    <th scope="col">Towns</th>
                                    <th scope="col">Districts</th>
                                    <th></th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr v-for="province in provinces">
                                    <td>
                                        <a class="text-heading text-primary-hover font-semibold" href="#">

                                            {{ province.name }}
                                        </a>
                                    </td>

                                    <td>{{ province.number_of_clients }} households</td>
                                    <td>{{ province.number_of_cities }}</td>
                                    <td>{{ province.number_of_towns }}</td>
                                    <td>{{ province.number_of_districts }}</td>

                                    <td class="text-end">
                                        <a href="#offcanvasCreate" @click="edit(province)" data-bs-toggle="offcanvas"
                                            class="btn btn-sm btn-square btn-neutral"><i class="bi bi-pencil"></i>
                                        </a>

                                        <button type="button" @click="deleteProvince(province)"
                                            class="btn btn-sm btn-square btn-neutral text-danger-hover"><i
                                                class="bi bi-trash"></i></button>
                                    </td>
                                </tr>

                            </tbody>
                        </table>
                    </div>
                    <div class="card-footer border-0 py-5"><span class="text-muted text-sm">Showing {{ provinces.length
                            }} results found</span></div>
                </div>
            </div>
        </div>
    </AppLayout>
</template>
