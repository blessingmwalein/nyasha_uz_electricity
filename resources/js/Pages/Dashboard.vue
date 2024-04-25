<script setup>
import AppLayout from '@/Layouts/AppLayout.vue';
import Welcome from '@/Components/Welcome.vue';
</script>

<template>
    <AppLayout title="Dashboard">

        <div class="container-fluid">

            <div class="row g-6 mb-6">
                <div class="col-xl-3 col-sm-6 col-12">
                    <div class="card">
                        <div class="card-body">
                            <div class="row">
                                <div class="col"><span
                                        class="h6 font-semibold text-muted text-sm d-block mb-2">Plants</span>
                                    <span class="h3 font-bold mb-0">10</span>
                                </div>
                                <div class="col-auto">
                                    <div class="icon icon-shape bg-tertiary text-white text-lg rounded-circle">
                                        <i class="bi bi-building-fill-gear"></i>
                                    </div>
                                </div>
                            </div>
                            <div class="mt-2 mb-0 text-sm"><span
                                    class="badge badge-pill bg-soft-success text-success me-2"><i
                                        class="bi bi-arrow-up me-1"></i>30%  </span><span
                                    class="text-nowrap text-xs text-muted">Kilowatts increase</span></div>
                        </div>
                    </div>
                </div>
                <div class="col-xl-3 col-sm-6 col-12">
                    <div class="card">
                        <div class="card-body">
                            <div class="row">
                                <div class="col"><span class="h6 font-semibold text-muted text-sm d-block mb-2">Clients</span> <span class="h3 font-bold mb-0">215</span></div>
                                <div class="col-auto">
                                    <div class="icon icon-shape bg-primary text-white text-lg rounded-circle"><i
                                            class="bi bi-people"></i></div>
                                </div>
                            </div>
                            <div class="mt-2 mb-0 text-sm"><span
                                    class="badge badge-pill bg-soft-success text-success me-2"><i
                                        class="bi bi-arrow-up me-1"></i>23% </span><span
                                    class="text-nowrap text-xs text-muted">Since last week</span></div>
                        </div>
                    </div>
                </div>
                <div class="col-xl-3 col-sm-6 col-12">
                    <div class="card">
                        <div class="card-body">
                            <div class="row">
                                <div class="col"><span class="h6 font-semibold text-muted text-sm d-block mb-2">Total Units Generated</span>
                                     <span class="h3 font-bold mb-0">1.400 <small>Kw</small></span></div>
                                <div class="col-auto">
                                    <div class="icon icon-shape bg-info text-white text-lg rounded-circle"><i
                                            class="bi bi-lightning-charge"></i></div>
                                </div>
                            </div>
                            <div class="mt-2 mb-0 text-sm"><span
                                    class="badge badge-pill bg-soft-danger text-danger me-2"><i
                                        class="bi bi-arrow-down me-1"></i>-10% </span><span
                                    class="text-nowrap text-xs text-muted">Since last month</span></div>
                        </div>
                    </div>
                </div>
                <div class="col-xl-3 col-sm-6 col-12">
                    <div class="card">
                        <div class="card-body">
                            <div class="row">
                                <div class="col"><span class="h6 font-semibold text-muted text-sm d-block mb-2">Algorithm Efficiency</span> <span class="h3 font-bold mb-0">95%</span></div>
                                <div class="col-auto">
                                    <div class="icon icon-shape bg-warning text-white text-lg rounded-circle"><i
                                            class="bi bi-code-slash"></i></div>
                                </div>
                            </div>
                            <div class="mt-2 mb-0 text-sm"><span
                                    class="badge badge-pill bg-soft-success text-success me-2"><i
                                        class="bi bi-arrow-up me-1"></i>15% </span><span
                                    class="text-nowrap text-xs text-muted">Since last week</span></div>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </AppLayout>
</template>
